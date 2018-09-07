using System;
using System.Runtime.InteropServices;

namespace ItWorks.Api.Infrastructure
{
    public static class UUId
    {
        /// <summary>
        /// This method can be used to retrieve well formed universally unique id. The advantage is, it has no vulnerability what GUID v1 and has good distribution so won't overload SQL Server
        /// </summary>
        /// <seealso>http://blogs.msdn.com/b/dbrowne/archive/2012/07/03/how-to-generate-sequential-guids-for-sql-server-in-net.aspx</seealso>
        /// <seealso>https://en.wikipedia.org/wiki/Universally_unique_identifier</seealso>
        /// <returns>Universallyy unique ID</returns>
        public static Guid NewSequentialId()
        {
            Guid guid;
            UuidCreateSequential(out guid);
            var s = guid.ToByteArray();
            var t = new byte[16];

            t[3] = s[0];
            t[2] = s[1];
            t[1] = s[2];
            t[0] = s[3];
            t[5] = s[4];
            t[4] = s[5];
            t[7] = s[6];
            t[6] = s[7];
            t[8] = s[8];
            t[9] = s[9];
            t[10] = s[10];
            t[11] = s[11];
            t[12] = s[12];
            t[13] = s[13];
            t[14] = s[14];
            t[15] = s[15];

            return new Guid(t);
        }

        [DllImport("rpcrt4.dll", SetLastError = true)]
        private static extern int UuidCreateSequential(out Guid guid);
    }
}
