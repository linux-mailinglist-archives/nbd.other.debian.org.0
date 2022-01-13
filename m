Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7443448D2E7
	for <lists+nbd@lfdr.de>; Thu, 13 Jan 2022 08:34:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 574BA202A2; Thu, 13 Jan 2022 07:34:50 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jan 13 07:34:50 2022
Old-Return-Path: <manfred@colorfullife.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2D13320639
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Jan 2022 07:34:25 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id TxPh-mDHQrFG for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Jan 2022 07:34:19 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .colorfullife. - helo: .mail-wm1-x336.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 9644B2063A
	for <nbd@other.debian.org>; Thu, 13 Jan 2022 07:34:19 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id 25-20020a05600c231900b003497473a9c4so4856704wmo.5
        for <nbd@other.debian.org>; Wed, 12 Jan 2022 23:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GPDHn87MaX7n4fFDfyJhK52z6CWK+obvCZhBDKBgMXE=;
        b=NkmgdUC7Dth8fGsV7xAlosApoiCnV0o04+uXNs1tA+MYtMMjg3GcJE3vI7BADe8sxf
         sCepA9uPMkLNOgSWIe8uZgG1zekDgIVw4k0hyBZolqzgq7L2R6knkFUCBS0F0igr7AuB
         YRPemfh9LV36jCwSEHxzO8fmD0l4RPlerWOZXnVvyHM8Ns2d92FojCfciNip0IMr1zK/
         J2S6yjyDFe8adLXxu9CaD8ftMc1Kzymp6HludmE1lcDINHrFwboyLJW+SJk8imQWfOI8
         MolbC0M1jJq3/XZQ64DgoRufk6WvTq3Oyc/WtouW5K9cqrjW0GvKNNLhoJh10rB0Epiy
         c73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GPDHn87MaX7n4fFDfyJhK52z6CWK+obvCZhBDKBgMXE=;
        b=xXtAkYJnsg2PY7LSffmEQZ5PJTbShk/mfD1ikzZIdOQdqlj4XWvJijgxnwWkq/COoe
         MgO6Ssua4kgNbY8P7ivx5QaPhK3AsmnQUwl1JJr7L4S2/UbQZ7fUn0tnsCH+vEre1OLa
         /MIVAfIqXA+hPXii5uWQL4rGHMynxYbJ7NeAySGXyrPBR55ICxu42HdPc8wf7EJtmBUU
         BSGpbsAeHUTzzTy39esMViVJBf077hNBTaYe09rb+kAYlogQ+Oi/WAiJ7NdH/DfayMmS
         edlqCp+O5PkGt71LGtjfq+e9kFmlDL/i+IQNcPkPR/D7tF9drW3lw1LVWvtI3g/Ukpgs
         R1Pg==
X-Gm-Message-State: AOAM5333+cVjqny/ZacRYKTNs705fQbbJQ8RQkm8dyJnP9a31RDVmm2I
	4TN9eXTiyq+dlq+UhGn1Jm2I0flHtRLL+KwF
X-Google-Smtp-Source: ABdhPJxpsPGf1nRy/Kut6z1TCzY8g5JYox77Dl9VSKZVgL4kKDQ3SVKHw3nP6w28SiEdqFlpAPKJyA==
X-Received: by 2002:a7b:cb44:: with SMTP id v4mr9875324wmj.20.1642059256956;
        Wed, 12 Jan 2022 23:34:16 -0800 (PST)
Received: from localhost.localdomain (p200300d99704790072586cbefa5b7408.dip0.t-ipconnect.de. [2003:d9:9704:7900:7258:6cbe:fa5b:7408])
        by smtp.googlemail.com with ESMTPSA id t7sm1740662wrx.48.2022.01.12.23.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 23:34:16 -0800 (PST)
From: Manfred Spraul <manfred@colorfullife.com>
To: nbd@other.debian.org
Cc: Manfred Spraul <manfred@colorfullife.com>,
	Manfred Spraul <manfred.spraul@de.bosch.com>
Subject: [PATCH 4/7] nbd-server: Log the replies
Date: Thu, 13 Jan 2022 08:34:04 +0100
Message-Id: <20220113073407.4742-5-manfred@colorfullife.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220113073407.4742-1-manfred@colorfullife.com>
References: <20220113073407.4742-1-manfred@colorfullife.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <d6zd2Ilq0GB.A.1rE.aY93hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1678
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220113073407.4742-5-manfred@colorfullife.com
Resent-Date: Thu, 13 Jan 2022 07:34:50 +0000 (UTC)

The transaction log contains only the request from the clients, the
replies from the server were missing.

The change adds the replies to the transaction log.

Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
---
 nbd-server.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/nbd-server.c b/nbd-server.c
index 5cd86b0..ccfebc9 100644
--- a/nbd-server.c
+++ b/nbd-server.c
@@ -2579,6 +2579,15 @@ static void setup_reply(struct nbd_reply* rep, struct nbd_request* req) {
 	memcpy(&(rep->handle), &(req->handle), sizeof(req->handle));
 }
 
+static void log_reply(CLIENT *client, struct nbd_reply *prply)
+{
+	if (client->transactionlogfd != -1) {
+		lock_logsem(client);
+		writeit(client->transactionlogfd, prply, sizeof(*prply));
+		unlock_logsem(client);
+	}
+}
+
 #ifdef HAVE_SPLICE
 static int handle_splice_read(CLIENT *client, struct nbd_request *req)
 {
@@ -2600,6 +2609,7 @@ static int handle_splice_read(CLIENT *client, struct nbd_request *req)
 
 	DEBUG("handling read request (splice)\n");
 	setup_reply(&rep, req);
+	log_reply(client, &rep);
 	pthread_mutex_lock(&(client->lock));
 	writeit(client->net, &rep, sizeof(rep));
 	spliceit(pipefd[0], NULL, client->net, NULL, req->len);
@@ -2623,6 +2633,7 @@ static void handle_normal_read(CLIENT *client, struct nbd_request *req)
 		DEBUG("Read failed: %m");
 		rep.error = nbd_errno(errno);
 	}
+	log_reply(client, &rep);
 	pthread_mutex_lock(&(client->lock));
 	socket_write(client, &rep, sizeof rep);
 	if(!rep.error) {
@@ -2671,6 +2682,7 @@ static void handle_write(struct work_package *pkg)
 			rep.error = nbd_errno(errno);
 		}
 	}
+	log_reply(client, &rep);
 	pthread_mutex_lock(&(client->lock));
 	socket_write(client, &rep, sizeof rep);
 	pthread_mutex_unlock(&(client->lock));
@@ -2684,6 +2696,7 @@ static void handle_flush(CLIENT* client, struct nbd_request* req) {
 		DEBUG("Flush failed: %m");
 		rep.error = nbd_errno(errno);
 	}
+	log_reply(client, &rep);
 	pthread_mutex_lock(&(client->lock));
 	socket_write(client, &rep, sizeof rep);
 	pthread_mutex_unlock(&(client->lock));
@@ -2697,6 +2710,7 @@ static void handle_trim(CLIENT* client, struct nbd_request* req) {
 		DEBUG("Trim failed: %m");
 		rep.error = nbd_errno(errno);
 	}
+	log_reply(client, &rep);
 	pthread_mutex_lock(&(client->lock));
 	socket_write(client, &rep, sizeof rep);
 	pthread_mutex_unlock(&(client->lock));
@@ -2714,6 +2728,7 @@ static void handle_write_zeroes(CLIENT* client, struct nbd_request* req) {
 	// For now, don't trim
 	// TODO: handle this far more efficiently with reference to the
 	// actual backing driver
+	log_reply(client, &rep);
 	pthread_mutex_lock(&(client->lock));
 	socket_write(client, &rep, sizeof rep);
 	pthread_mutex_unlock(&(client->lock));
@@ -2800,6 +2815,7 @@ static void handle_request(gpointer data, gpointer user_data) {
 error:
 	setup_reply(&rep, package->req);
 	rep.error = nbd_errno(err);
+	log_reply(package->client, &rep);
 	pthread_mutex_lock(&(package->client->lock));
 	socket_write(package->client, &rep, sizeof rep);
 	pthread_mutex_unlock(&(package->client->lock));
-- 
2.33.1

