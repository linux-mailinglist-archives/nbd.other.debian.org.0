Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMjeCM3nwGl6OQQAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Mon, 23 Mar 2026 08:12:13 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CE42ED566
	for <lists+nbd@lfdr.de>; Mon, 23 Mar 2026 08:12:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9F47A20495; Mon, 23 Mar 2026 07:12:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Mar 23 07:12:12 2026
Old-Return-Path: <3muPAaQYKA7kjtmhxtfnnfkd.bnlmacnsgdq.cdahZm.nqf@flex--kuniyu.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	RCVD_IN_DNSWL_NONE,USER_IN_DEF_DKIM_WL,WORD_WITHOUT_VOWELS
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 548EF2059E
	for <lists-other-nbd@bendel.debian.org>; Mon, 23 Mar 2026 06:54:33 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.601 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_MED=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, RCVD_IN_DNSWL_NONE=-0.0001,
	USER_IN_DEF_DKIM_WL=-7.5, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id YrVn8MvOv85l for <lists-other-nbd@bendel.debian.org>;
	Mon, 23 Mar 2026 06:54:26 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-pg1-x549.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2 RANDOM_SENDER=0.25; rate: -5.25
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 135B52059D
	for <nbd@other.debian.org>; Mon, 23 Mar 2026 06:54:22 +0000 (UTC)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-c709551ec08so18195736a12.3
        for <nbd@other.debian.org>; Sun, 22 Mar 2026 23:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774248859; x=1774853659; darn=other.debian.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mao9DUlBnmujuW3A+CUh4bfJbpHQEdFcui9ik7MVEWE=;
        b=u3AfdTjJV2Jm9prP4EaVv/G7K6sgdzBynY8XQCuamnfwiwq2x2U/s87hNs1wr+THKB
         NK1dzLk4Z9IptzS28NgizNhdMoroPI6VHWfrDTj29wAwa4W4+Uzb5dlyyLau0SySmbDo
         f7mAdcJnAOPtWYUDZXbR1NGtcNOnH6fabYsc47wlA2bepM+rm9JelKoc0owVbS1vLk7Y
         L1NmFSrVMpmT4ixVPbsCkpLe4sF2k/DYxcrvIFEGi1lelUdyS5EbELoUEFdKazwkazJC
         68c3n3+UwTaQbd/RdWc/Z6bbPX0kaIX6Eg3a6f/SsBPuZ62UdaRYx5Ah1s/mHEUerCs2
         yvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774248859; x=1774853659;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mao9DUlBnmujuW3A+CUh4bfJbpHQEdFcui9ik7MVEWE=;
        b=L1cT+QzvMpvbhP7yH5Wy6aYzFgbDjgQLX1jRw4Uy6SGXnJwMyvkUWHX+/gagUpSoRP
         JPMAC0GbGq7irqoE0qs/WP63d3qHGq4kzKPi47+3lslYWttetSmXmCfxemcG/HiBHosR
         P5XnrnCN1VLj10T9dxN00ZcRXD/pblvIxBB6tBClzCpjMbrGCoAXKB2mo8IXOM859LcC
         dJYYvCua1uWzcsdzSKf4VBIgbtr//nZQ0LG9AyZgQYXG9fVn8zPNvOOMfyCOD6EuUEqF
         GEt4fLJbHF9DYO/LD7rTragIloa/Bv2KP6mS6tB+MVE+WnBe1KUfuAcIlZzzmalKKxXh
         QvKw==
X-Forwarded-Encrypted: i=1; AJvYcCXUcshB90jb2GxiTTH9nMxmzF4i7MwiceSFd7w/hdTlbYdKeh6xkgHyyQ1qlz6bS5DutUg=@other.debian.org
X-Gm-Message-State: AOJu0Yzm8dE/2O95GjDoBxGHxNtbKWkIj/P8V0yYC/RSZAmpAvKFoCJ0
	ObWg7ITkgGO8b/YMimL41riWcglXUB8I0WkhpdVFVZqFrjVVLm9Lmw9IeL2vyE1OR0oOHMLh9vT
	vwtXKNg==
X-Received: from pfbho9.prod.google.com ([2002:a05:6a00:8809:b0:829:a228:6330])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4290:b0:81f:4675:c2a9
 with SMTP id d2e1a72fcca58-82a8bf743eemr10439812b3a.0.1774248858592; Sun, 22
 Mar 2026 23:54:18 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:54:05 +0000
In-Reply-To: <258f99ac-bd34-4d14-8271-1266b9aba6f8@redhat.com>
Mime-Version: 1.0
References: <258f99ac-bd34-4d14-8271-1266b9aba6f8@redhat.com>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
Message-ID: <20260323065417.710353-1-kuniyu@google.com>
Subject: Re: [PATCH net v1] net/ipv6: mcast: fix circular locking dependency
 in __ipv6_dev_mc_inc()
From: Kuniyuki Iwashima <kuniyu@google.com>
To: pabeni@redhat.com
Cc: ap420073@gmail.com, davem@davemloft.net, dsahern@kernel.org, 
	edumazet@google.com, horms@kernel.org, jiayuan.chen@linux.dev, 
	jiayuan.chen@shopee.com, josef@toxicpanda.com, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, nbd@other.debian.org, netdev@vger.kernel.org, 
	syzbot+afbcf622635e98bf40d2@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <lAtKvmtj6DN.A.-raI.MfOwpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3522
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20260323065417.710353-1-kuniyu@google.com
Resent-Date: Mon, 23 Mar 2026 07:12:12 +0000 (UTC)
X-Spamd-Result: default: False [1.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:pabeni@redhat.com,m:ap420073@gmail.com,m:davem@davemloft.net,m:dsahern@kernel.org,m:edumazet@google.com,m:horms@kernel.org,m:jiayuan.chen@linux.dev,m:jiayuan.chen@shopee.com,m:josef@toxicpanda.com,m:kuba@kernel.org,m:linux-kernel@vger.kernel.org,m:nbd@other.debian.org,m:netdev@vger.kernel.org,m:syzbot+afbcf622635e98bf40d2@syzkaller.appspotmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	R_SPF_NA(0.00)[no SPF record];
	FORGED_SENDER(0.00)[kuniyu@google.com,bounce-nbd=lists@other.debian.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	FREEMAIL_CC(0.00)[gmail.com,davemloft.net,kernel.org,google.com,linux.dev,shopee.com,toxicpanda.com,vger.kernel.org,other.debian.org,syzkaller.appspotmail.com];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[kuniyu@google.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	TAGGED_RCPT(0.00)[nbd,afbcf622635e98bf40d2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bendel.debian.org:helo,bendel.debian.org:rdns]
X-Rspamd-Queue-Id: C2CE42ED566
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Paolo Abeni <pabeni@redhat.com>
Date: Thu, 19 Mar 2026 13:44:00 +0100
> Adding Josef.
> 
> On 3/19/26 4:26 AM, Jakub Kicinski wrote:
> > On Thu, 19 Mar 2026 11:04:24 +0800 Jiayuan Chen wrote:
> >>>> Split mca_alloc() into mca_alloc() + mca_init(): mca_alloc() does the
> >>>> GFP_KERNEL allocation before mc_lock, mca_init() initializes under
> >>>> mc_lock. If the address already exists, the pre-allocated memory is
> >>>> simply freed. Also move inet6_ifmcaddr_notify() outside mc_lock since
> >>>> it also does GFP_KERNEL allocation.  
> >>> Moving the allocation seems fine, but also having to move the
> >>> notification, potentially letting the notification go out of order
> >>> makes me wonder if we aren't better off adding helpers for taking this
> >>> lock which also call memalloc_noio_{save,restore} ?  
> >> Yeah, using memalloc_noio helpers is simpler. I checked and there
> >> are about 18 places taking mc_lock, so having a common mc_lock()/mc_unlock()
> >> wrapper that does the noio save/restore covers them all (if necessary).
> >>
> >> The only thing that feels a bit odd is using memalloc_noio in the networking
> >> subsystem. It makes sense in block/fs to protect itself from recursion.
> > 
> > Totally agree that it feels a bit odd that we have to worry about IO,
> > but unless we can figure out a way to prevent nbd sockets from getting
> > here all our solutions are dealing with noio in networking code :(
> > IMHO it's better to acknowledge this with the explicit memalloc_noio 
> > so future developers don't break things again with a mis-placed
> > allocation.
> 
> I think a problem here is that the nbd socket is still exposed to
> user-space, while in use by the block device.

Right, and this also prevents us from changing lockdep keys
(due to lock_sock_fast()).


> I fear that the more
> syzkaller will learn new tricks, the more we will have to had strange
> noio all around the networking code.

I agree.  We have 100+ unpublished reports for this variant, and
I started looking into them last week.


> 
> I *think* we could prevent this kind of races with something alike the
> following:
> - nbd sets a DOIO sk flag on the sockets it uses.
> - the socket layer prevents socketopts()/ioctl() entirely on DOIO sk

NBD sets sk->sk_allocation, so if we use it around, there should
be no real race, but still lockdep would not be happy.

The problem is sendmsg() and shutdown() invoked from NBD (recmsg()
is okay which is not under tx_lock), and my idea is to implemnt the
trylock variant for lock_sock() and use it for TCP. ( AF_UNIX does
not have the race because it does not use lock_sock() in sendmsg()
and shutdown() )

sendmsg() will be retried with -ERESTARTSYS where needed thanks to
was_interrupted().  While sendmsg() for disconnect and shutdown()
could be missed, but probably not a big deal (the peer will get
RST when it send something) ?

If this looks good, I'll send a formal patch.

---8<---
diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index fe63f3c55d0d..9003baf52be8 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -45,6 +45,8 @@
 #include <linux/nbd.h>
 #include <linux/nbd-netlink.h>
 #include <net/genetlink.h>
+#include <net/tcp.h>
+#include <net/inet_common.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/nbd.h>
@@ -302,6 +304,19 @@ static int nbd_disconnected(struct nbd_config *config)
 		test_bit(NBD_RT_DISCONNECT_REQUESTED, &config->runtime_flags);
 }
 
+static void nbd_sock_shutdown(struct sock *sk)
+{
+	if (sk_is_stream_unix(sk)) {
+		kernel_sock_shutdown(sk->sk_socket, SHUT_RDWR);
+		return;
+	}
+
+	if (lock_sock_try(sk)) {
+		inet_shutdown_locked(sk->sk_socket, SHUT_RDWR);
+		release_sock(sk);
+	}
+}
+
 static void nbd_mark_nsock_dead(struct nbd_device *nbd, struct nbd_sock *nsock,
 				int notify)
 {
@@ -315,7 +330,8 @@ static void nbd_mark_nsock_dead(struct nbd_device *nbd, struct nbd_sock *nsock,
 		}
 	}
 	if (!nsock->dead) {
-		kernel_sock_shutdown(nsock->sock, SHUT_RDWR);
+		nbd_sock_shutdown(nsock->sock->sk);
+
 		if (atomic_dec_return(&nbd->config->live_connections) == 0) {
 			if (test_and_clear_bit(NBD_RT_DISCONNECT_REQUESTED,
 					       &nbd->config->runtime_flags)) {
@@ -548,6 +564,22 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req)
 	return BLK_EH_DONE;
 }
 
+static int nbd_sock_sendmsg(struct socket *sock, struct msghdr *msg)
+{
+	struct sock *sk = sock->sk;
+	int err = -ERESTARTSYS;
+
+	if (sk_is_stream_unix(sk))
+		return sock_sendmsg(sock, msg);
+
+	if (lock_sock_try(sk)) {
+		err = tcp_sendmsg_locked(sk, msg, msg_data_left(msg));
+		release_sock(sk);
+	}
+
+	return err;
+}
+
 static int __sock_xmit(struct nbd_device *nbd, struct socket *sock, int send,
 		       struct iov_iter *iter, int msg_flags, int *sent)
 {
@@ -573,7 +605,7 @@ static int __sock_xmit(struct nbd_device *nbd, struct socket *sock, int send,
 			msg.msg_flags = msg_flags | MSG_NOSIGNAL;
 
 			if (send)
-				result = sock_sendmsg(sock, &msg);
+				result = nbd_sock_sendmsg(sock, &msg);
 			else
 				result = sock_recvmsg(sock, &msg, msg.msg_flags);
 
@@ -1228,6 +1260,13 @@ static struct socket *nbd_get_socket(struct nbd_device *nbd, unsigned long fd,
 		return NULL;
 	}
 
+	if (READ_ONCE(sock->sk->sk_state) != TCP_ESTABLISHED) {
+		dev_err(disk_to_dev(nbd->disk), "Unsupported socket: not connected yet.\n");
+		*err = -ENOTCONN;
+		sockfd_put(sock);
+		return NULL;
+	}
+
 	if (sock->ops->shutdown == sock_no_shutdown) {
 		dev_err(disk_to_dev(nbd->disk), "Unsupported socket: shutdown callout must be supported.\n");
 		*err = -EINVAL;
diff --git a/include/net/inet_common.h b/include/net/inet_common.h
index 5dd2bf24449e..c085c39573c9 100644
--- a/include/net/inet_common.h
+++ b/include/net/inet_common.h
@@ -38,6 +38,7 @@ void inet_splice_eof(struct socket *sock);
 int inet_recvmsg(struct socket *sock, struct msghdr *msg, size_t size,
 		 int flags);
 int inet_shutdown(struct socket *sock, int how);
+int inet_shutdown_locked(struct socket *sock, int how);
 int inet_listen(struct socket *sock, int backlog);
 int __inet_listen_sk(struct sock *sk, int backlog);
 void inet_sock_destruct(struct sock *sk);
diff --git a/include/net/sock.h b/include/net/sock.h
index 6c9a83016e95..203a60661fce 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -1710,6 +1710,24 @@ static inline void lock_sock(struct sock *sk)
 }
 
 void __lock_sock(struct sock *sk);
+
+static inline bool lock_sock_try(struct sock *sk)
+{
+	if (!spin_trylock_bh(&sk->sk_lock.slock))
+		return false;
+
+	if (sk->sk_lock.owned) {
+		spin_unlock_bh(&sk->sk_lock.slock);
+		return false;
+	}
+
+	sk->sk_lock.owned = 1;
+	spin_unlock_bh(&sk->sk_lock.slock);
+
+	mutex_acquire(&sk->sk_lock.dep_map, 0, 1, _RET_IP_);
+	return true;
+}
+
 void __release_sock(struct sock *sk);
 void release_sock(struct sock *sk);
 
diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
index 8036e76aa1e4..bde8ddcc28f0 100644
--- a/net/ipv4/af_inet.c
+++ b/net/ipv4/af_inet.c
@@ -896,21 +896,11 @@ int inet_recvmsg(struct socket *sock, struct msghdr *msg, size_t size,
 }
 EXPORT_SYMBOL(inet_recvmsg);
 
-int inet_shutdown(struct socket *sock, int how)
+static int __inet_shutdown(struct socket *sock, int how)
 {
 	struct sock *sk = sock->sk;
 	int err = 0;
 
-	/* This should really check to make sure
-	 * the socket is a TCP socket. (WHY AC...)
-	 */
-	how++; /* maps 0->1 has the advantage of making bit 1 rcvs and
-		       1->2 bit 2 snds.
-		       2->3 */
-	if ((how & ~SHUTDOWN_MASK) || !how)	/* MAXINT->0 */
-		return -EINVAL;
-
-	lock_sock(sk);
 	if (sock->state == SS_CONNECTING) {
 		if ((1 << sk->sk_state) &
 		    (TCPF_SYN_SENT | TCPF_SYN_RECV | TCPF_CLOSE))
@@ -947,11 +937,45 @@ int inet_shutdown(struct socket *sock, int how)
 
 	/* Wake up anyone sleeping in poll. */
 	sk->sk_state_change(sk);
+
+	return err;
+}
+
+int inet_shutdown(struct socket *sock, int how)
+{
+	struct sock *sk = sock->sk;
+	int err;
+
+	/* maps 0->1 has the advantage of making bit 1 rcvs and
+	 *      1->2 bit 2 snds.
+	 *      2->3
+	 */
+	how++;
+
+	if ((how & ~SHUTDOWN_MASK) || !how)
+		return -EINVAL;
+
+	lock_sock(sk);
+	err = __inet_shutdown(sock, how);
 	release_sock(sk);
+
 	return err;
 }
 EXPORT_SYMBOL(inet_shutdown);
 
+int inet_shutdown_locked(struct socket *sock, int how)
+{
+	sock_owned_by_me(sock->sk);
+
+	how++;
+
+	if ((how & ~SHUTDOWN_MASK) || !how)
+		return -EINVAL;
+
+	return __inet_shutdown(sock, how);
+}
+EXPORT_SYMBOL_GPL(inet_shutdown_locked);
+
 /*
  *	ioctl() calls you can issue on an INET socket. Most of these are
  *	device configuration and stuff and very rarely used. Some ioctls
---8<---

