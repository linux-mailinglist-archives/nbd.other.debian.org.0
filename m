Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DDE42C9E
	for <lists+nbd@lfdr.de>; Wed, 12 Jun 2019 18:48:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 58F5720403; Wed, 12 Jun 2019 16:48:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun 12 16:48:09 2019
Old-Return-Path: <roman.stratiienko@globallogic.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,FOURLA,
	MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,TO_TOO_MANY,
	WORD_WITHOUT_VOWELS autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DCABB203AE
	for <lists-other-nbd@bendel.debian.org>; Wed, 12 Jun 2019 16:32:01 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	TO_TOO_MANY=1, WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id kk7boTGm105j for <lists-other-nbd@bendel.debian.org>;
	Wed, 12 Jun 2019 16:31:57 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .globallogic. - helo: .mail-lj1-x242.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 12DBC203A8
	for <nbd@other.debian.org>; Wed, 12 Jun 2019 16:31:56 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id a21so15664782ljh.7
        for <nbd@other.debian.org>; Wed, 12 Jun 2019 09:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=globallogic.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HGZCcHNEAujaoQpz7hTvgflL6M87QkjZmmLX2/Xue6Q=;
        b=RUC+EYhpraNYK/Rlf/N0BEPsjELRPixbnog9GgyvTc++6Ug0xNyEsE2eHaMcUEVDgM
         +acMFdIzEEgOiWP773/EGircb6ihqaea5gRG8vNyaejkh7Lu2boHJEbSjFNJS8rd2Pmm
         qzV08oC0SnNpSLHcHYuzNE5FcrLKThcMbut26fiDnH0r+f0XjFlozDHl3y5dCJ13LIGo
         QWuQJLkIfbGRxuQc48ae2Huyxk+kGChEvj74I/YadPtiUbYDVudqP+MdBm75n6UEQkpv
         wVTEg7CzA0tIa661hPzkvJA6K/K3QbGDe2P3VBx6XeL4j/2zQF9tKUYbui3NL8kIbA4u
         KqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HGZCcHNEAujaoQpz7hTvgflL6M87QkjZmmLX2/Xue6Q=;
        b=Wg59piy35LCSBuhV9Pxw+Acd4B+tGs1p0zkUmaSELZr2zVnzFd9PR57nKiMsZs8YDS
         H34vw8It4iO4bwA8+UK7S9pD0tXawUKpqGLuIUapiS/omHkrC2XbPfX2Qg7Wk9AfcyQx
         GzvbCK9BeOVQFPlEj6lj5rTB2+RIe7Gv3AhxNBVzoict8ioC4s69jG5j/cWeqgYO/DE9
         fB8Gzvu4p/o2tcSp9WSnyARA8pRFhh174hJkeJ2XBTwQy4x0UX8c0g6HjMgmG7TM6seC
         W/ito/+mFIfaR9NW+Z5iV/i6ZHROM0ltkTnADC6m5B+zUr04+zI1YOTYUqAmixdSyYYL
         M1Rg==
X-Gm-Message-State: APjAAAVHqonWbUBlVsV5COIH8besaEsgFsONEoAGXfS3qwNb9NGJCzr7
	cO5vT/VA21+/t/7XjK8xoel0CA==
X-Google-Smtp-Source: APXvYqylIJwYaB2IbLbaiDOpf7UoxWY9LigMZytt9CrNcVDG0hk9EVsNyJIyC59DZWUEwIBD1AmV/A==
X-Received: by 2002:a2e:12c8:: with SMTP id 69mr33409068ljs.189.1560357114332;
        Wed, 12 Jun 2019 09:31:54 -0700 (PDT)
Received: from virtualhost-PowerEdge-R810.synapse.com ([195.238.92.107])
        by smtp.gmail.com with ESMTPSA id e26sm54358ljl.33.2019.06.12.09.31.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 09:31:53 -0700 (PDT)
From: roman.stratiienko@globallogic.com
To: linux-kernel@vger.kernel.org,
	josef@toxicpanda.com,
	nbd@other.debian.org,
	A.Bulyshchenko@globallogic.com,
	linux-block@vger.kernel.org,
	axboe@kernel.dkn.org
Cc: Roman Stratiienko <roman.stratiienko@globallogic.com>
Subject: [PATCH 2/2] nbd: add support for nbd as root device
Date: Wed, 12 Jun 2019 19:31:44 +0300
Message-Id: <20190612163144.18486-2-roman.stratiienko@globallogic.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190612163144.18486-1-roman.stratiienko@globallogic.com>
References: <20190612163144.18486-1-roman.stratiienko@globallogic.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <DztfQDvU16B.A.VNH.JzSAdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/579
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190612163144.18486-2-roman.stratiienko@globallogic.com
Resent-Date: Wed, 12 Jun 2019 16:48:09 +0000 (UTC)

From: Roman Stratiienko <roman.stratiienko@globallogic.com>

Adding support to nbd to use it as a root device. This code essentially
provides a minimal nbd-client implementation within the kernel. It opens
a socket and makes the negotiation with the server. Afterwards it passes
the socket to the normal nbd-code to handle the connection.

The arguments for the server are passed via kernel command line.
The kernel command line has the format
'nbdroot=[<SERVER_IP>:]<SERVER_PORT>/<EXPORT_NAME>'.
SERVER_IP is optional. If it is not available it will use the
root_server_addr transmitted through DHCP.

Based on those arguments, the connection to the server is established
and is connected to the nbd0 device. The rootdevice therefore is
root=/dev/nbd0.

Patch was initialy posted by Markus Pargmann <mpa@pengutronix.de>
and can be found at https://lore.kernel.org/patchwork/patch/532556/

Change-Id: I78f7313918bf31b9dc01a74a42f0f068bede312c
Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
Reviewed-by: Aleksandr Bulyshchenko <A.Bulyshchenko@globallogic.com>
---
 drivers/block/Kconfig |  19 +++
 drivers/block/nbd.c   | 294 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 313 insertions(+)

diff --git a/drivers/block/Kconfig b/drivers/block/Kconfig
index 20bb4bfa4be6..e17f2376de60 100644
--- a/drivers/block/Kconfig
+++ b/drivers/block/Kconfig
@@ -273,6 +273,25 @@ config BLK_DEV_NBD
 
 	  If unsure, say N.
 
+config BLK_DEV_NBDROOT
+	bool "Early network block device client support"
+	depends on BLK_DEV_NBD=y
+	---help---
+	  Saying yes will enable kernel NBD client support. This allows to
+	  connect entire disk with multiple partitions before mounting rootfs.
+
+	  The arguments for the server are passed via kernel command line.
+	  The kernel command line has the format
+	  'nbdroot=[<SERVER_IP>:]<SERVER_PORT>/<EXPORT_NAME>'.
+	  SERVER_IP is optional. If it is not available it will use the
+	  root_server_addr transmitted through DHCP.
+
+	  Based on those arguments, the connection to the server is established
+	  and is connected to the nbd0 device. The rootdevice therefore is
+	  root=/dev/nbd0.
+
+	  If unsure, say N.
+
 config BLK_DEV_SKD
 	tristate "STEC S1120 Block Driver"
 	depends on PCI
diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 63fcfb38e640..cb5e60419e07 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -46,6 +46,35 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/nbd.h>
 
+#include <net/ipconfig.h>
+#include <linux/in.h>
+#include <linux/tcp.h>
+#include <linux/nfs_fs.h>
+#include <linux/nfs.h>
+
+#define ADDR_NONE cpu_to_be32(INADDR_NONE)
+
+static const char nbd_magic[] = "NBDMAGIC";
+static const u64 nbd_opts_magic = 0x49484156454F5054LL;
+
+/* Options used for the kernel driver */
+#define NBD_OPT_EXPORT_NAME 1
+
+#define NBD_DEFAULT_BLOCKSIZE 512 /* bytes */
+
+#define NBD_DEFAULT_TIMEOUT 2 /* seconds */
+
+#define NBD_MAXPATHLEN  NFS_MAXPATHLEN
+
+struct nbdroot {
+	const char *bdev;
+	__be32 server_addr;
+	__be32 server_port;
+	loff_t block_size;
+	int timeout;
+	char server_export[NBD_MAXPATHLEN + 1];
+};
+
 static DEFINE_IDR(nbd_index_idr);
 static DEFINE_MUTEX(nbd_index_mutex);
 static int nbd_total_devices = 0;
@@ -441,6 +470,16 @@ static int sock_xmit(struct socket *sock, int send,
 	return result;
 }
 
+static int sock_xmit_buf(struct socket *sock, int send,
+			 void *buf, size_t size)
+{
+	struct iov_iter iter;
+	struct kvec iov = {.iov_base = buf, .iov_len = size};
+
+	iov_iter_kvec(&iter, WRITE | ITER_KVEC, &iov, 1, size);
+	return sock_xmit(sock, send, &iter, 0, 0);
+}
+
 static int nbd_xmit(struct nbd_device *nbd, int index, int send,
 		     struct iov_iter *iter, int msg_flags, int *sent)
 {
@@ -2301,6 +2340,261 @@ static void __exit nbd_cleanup(void)
 	unregister_blkdev(NBD_MAJOR, "nbd");
 }
 
+#ifdef CONFIG_BLK_DEV_NBDROOT
+
+struct nbdroot nbdroot_0 = {.bdev = "nbd0",
+			    .server_export = "",
+			    .server_addr = ADDR_NONE,
+			    .timeout = NBD_DEFAULT_TIMEOUT,
+			    .block_size = NBD_DEFAULT_BLOCKSIZE};
+
+static int nbd_connect(struct nbdroot *nbdroot, struct socket **socket)
+{
+	struct socket *sock;
+	struct sockaddr_in sockaddr;
+	int err;
+	char val;
+
+	err = sock_create_kern(&init_net, AF_INET, SOCK_STREAM,
+			       IPPROTO_TCP, &sock);
+	if (err < 0)
+		return err;
+
+	sockaddr.sin_family = AF_INET;
+	sockaddr.sin_addr.s_addr = nbdroot->server_addr;
+	sockaddr.sin_port = nbdroot->server_port;
+
+	val = 1;
+	sock->ops->setsockopt(sock, IPPROTO_TCP, TCP_NODELAY, &val,
+			      sizeof(val));
+
+	err = sock->ops->connect(sock, (struct sockaddr *)&sockaddr,
+				 sizeof(sockaddr), 0);
+	if (err < 0)
+		return err;
+
+	*socket = sock;
+
+	return 0;
+}
+
+static int nbd_connection_negotiate(struct socket *sock, char *export_name,
+				    size_t *rsize, u16 *nflags)
+{
+	char buf[256];
+	int ret;
+	u64 magic;
+	u16 flags;
+	u32 client_flags;
+	u32 opt;
+	u32 name_len;
+	u64 nbd_size;
+
+	ret = sock_xmit_buf(sock, 0, buf, 8);
+	if (ret < 0)
+		return ret;
+
+	if (strncmp(buf, nbd_magic, 8))
+		return -EINVAL;
+
+	ret = sock_xmit_buf(sock, 0, &magic, sizeof(magic));
+	if (ret < 0)
+		return ret;
+	magic = be64_to_cpu(magic);
+
+	if (magic != nbd_opts_magic)
+		return -EINVAL;
+
+	ret = sock_xmit_buf(sock, 0, &flags, sizeof(flags));
+	if (ret < 0)
+		return ret;
+
+	*nflags = ntohs(flags);
+
+	client_flags = 0;
+
+	ret = sock_xmit_buf(sock, 1, &client_flags, sizeof(client_flags));
+	if (ret < 0)
+		return ret;
+
+	magic = cpu_to_be64(nbd_opts_magic);
+	ret = sock_xmit_buf(sock, 1, &magic, sizeof(magic));
+	if (ret < 0)
+		return ret;
+
+	opt = htonl(NBD_OPT_EXPORT_NAME);
+	ret = sock_xmit_buf(sock, 1, &opt, sizeof(opt));
+	if (ret < 0)
+		return ret;
+
+	name_len = strlen(export_name) + 1;
+	name_len = htonl(name_len);
+	ret = sock_xmit_buf(sock, 1, &name_len, sizeof(name_len));
+	if (ret < 0)
+		return ret;
+
+	ret = sock_xmit_buf(sock, 1, export_name, strlen(export_name) + 1);
+	if (ret < 0)
+		return ret;
+
+	ret = sock_xmit_buf(sock, 0, &nbd_size, sizeof(nbd_size));
+	if (ret < 0)
+		return ret;
+	nbd_size = be64_to_cpu(nbd_size);
+
+	ret = sock_xmit_buf(sock, 0, &flags, sizeof(flags));
+	if (ret < 0)
+		return ret;
+	*nflags = ntohs(flags);
+
+	ret = sock_xmit_buf(sock, 0, buf, 124);
+	if (ret < 0)
+		return ret;
+
+	*rsize = nbd_size;
+
+	return 0;
+}
+
+static int nbd_bind_connection(struct nbdroot *nbdroot, struct nbd_device *nbd,
+			       struct socket *sock, size_t rsize, u32 flags)
+{
+	int conn, ret;
+	struct block_device *bdev = blkdev_get_by_dev(disk_devt(nbd->disk),
+					FMODE_READ | FMODE_WRITE, 0);
+
+	if (IS_ERR(bdev)) {
+		pr_err("nbdroot: blkdev_get_by_dev failed %ld\n",
+		       PTR_ERR(bdev));
+		return PTR_ERR(bdev);
+	}
+
+	conn = nbd->config->num_connections;
+	ret = nbd_add_socket(nbd, sock, false);
+	if (ret) {
+		pr_err("nbdroot: add socket failed %d\n", ret);
+		return ret;
+	}
+
+	mutex_lock(&nbd->config->socks[conn]->tx_lock);
+
+	nbd->config->flags = flags;
+
+	nbd_size_set(nbd, nbdroot->block_size,
+		     div_s64(rsize, nbdroot->block_size));
+
+	nbd->tag_set.timeout = nbdroot->timeout * HZ;
+	blk_queue_rq_timeout(nbd->disk->queue, nbdroot->timeout * HZ);
+
+	mutex_unlock(&nbd->config->socks[conn]->tx_lock);
+
+	ret = nbd_start_device_ioctl(nbd, bdev);
+	if (ret) {
+		pr_err("nbdroot: start device ioctl failed %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int nbdroot_thread(void *arg)
+{
+	struct nbdroot *nbdroot = (struct nbdroot *)arg;
+	struct socket *sock = 0;
+	size_t rsize;
+	u16 nflags;
+	int ret;
+	dev_t devt = blk_lookup_devt(nbdroot->bdev, 0);
+	struct gendisk *disk = get_gendisk(devt, &ret);
+	struct nbd_device *nbd = (struct nbd_device *)disk->private_data;
+
+	ret = nbd_connect(nbdroot, &sock);
+	if (ret) {
+		pr_err("nbdroot: connect failed %d\n", ret);
+		goto err;
+	}
+
+	ret = nbd_connection_negotiate(sock, nbdroot->server_export,
+				       &rsize, &nflags);
+	if (ret) {
+		pr_err("nbdroot: negotiation failed %d\n", ret);
+		goto err;
+	}
+
+	ret = nbd_bind_connection(nbdroot, nbd, sock, rsize, nflags);
+	if (ret) {
+		pr_err("nbdroot: nbd_bind_connection failed %d\n", ret);
+		goto err;
+	}
+	return 0;
+
+err:
+	pr_err("nbdroot: %s init failed, IP: %pI4, port: %i, export: %s\n",
+	       nbdroot->bdev, &nbdroot->server_addr,
+	       ntohs(nbdroot->server_port), nbdroot->server_export);
+
+	if (sock)
+		sock_release(sock);
+
+	return ret;
+}
+
+static int __init nbdroot_init(void)
+{
+	if (nbdroot_0.server_port != 0)
+		kthread_run(nbdroot_thread, &nbdroot_0, "nbdroot_0");
+
+	return 0;
+}
+
+/* We need this in late_initcall_sync to be sure that the network is setup */
+late_initcall_sync(nbdroot_init);
+
+/*
+ * Parse format "[<SERVER_IP>:]<SERVER_PORT>/<EXPORT_NAME>"
+ */
+static int __init nbdroot_setup(char *line)
+{
+	struct nbdroot *nbdroot = &nbdroot_0;
+	char *export;
+	u16 port;
+	int ret;
+	char buf[NBD_MAXPATHLEN + 1];
+
+	strlcpy(buf, line, sizeof(buf) - 1);
+
+	nbdroot->server_addr = root_nfs_parse_addr(buf);
+
+	if (*buf == '\0')
+		return -EINVAL;
+
+	if (nbdroot->server_addr == ADDR_NONE) {
+		if (root_server_addr == ADDR_NONE) {
+			pr_err("nbdroot: Failed to find server address\n");
+			return -EINVAL;
+		}
+		nbdroot->server_addr = root_server_addr;
+	}
+
+	export = strchr(buf, '/');
+	*export = '\0';
+	++export;
+
+	ret = kstrtou16(buf, 10, &port);
+	if (ret)
+		return ret;
+
+	nbdroot->server_port = htons(port);
+	strlcpy(nbdroot->server_export, export,
+		sizeof(nbdroot->server_export) - 1);
+
+	return 0;
+}
+
+__setup("nbdroot=", nbdroot_setup);
+
+#endif /* CONFIG_BLK_DEV_NBDROOT */
+
 module_init(nbd_init);
 module_exit(nbd_cleanup);
 
-- 
2.17.1

