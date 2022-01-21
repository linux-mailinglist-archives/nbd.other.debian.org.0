Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC2D4964AA
	for <lists+nbd@lfdr.de>; Fri, 21 Jan 2022 18:58:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E252020514; Fri, 21 Jan 2022 17:58:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jan 21 17:58:14 2022
Old-Return-Path: <manfred@colorfullife.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6E41820520
	for <lists-other-nbd@bendel.debian.org>; Fri, 21 Jan 2022 17:57:38 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id LJZ_XG6wPu_C for <lists-other-nbd@bendel.debian.org>;
	Fri, 21 Jan 2022 17:57:32 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 8B92020515
	for <nbd@other.debian.org>; Fri, 21 Jan 2022 17:57:29 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id i2so1085034wrb.12
        for <nbd@other.debian.org>; Fri, 21 Jan 2022 09:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Al6MZIcJCcqJmhWCg2Dcbv+XvixG+8GmUNvFS20Yl5w=;
        b=e+jUV3Jw5WQFhJB4yEWQm7iayK7KK1BMQ5Tav6WiICPEFlM++jYi4I5pWT77zBB/Eg
         aUlN2RyR9v5f1HigK5+FT4wXj9Yezfvggu+vLUIJugCTNdZMBbSSSuZCfLYOt4t1LzwB
         +4NI5WcM0s5cq9rRCJhBNSl5ZL18ENKhsGMbq7fIEYYzGBoM2FrRHPcY2HW/nTqNAfKd
         WLqjv/pvHAaEpDUIL0T/0C/lsG9p47f5KmRNvOtpSAM/YmBy86YZVIokxXsptfai28Jg
         PUGlC5D9DeCsrOkxqJukl3R+5s+EiV6bC9JZk+ef34ww7+qKhwYnsidfMuCR+M8X4OM8
         K3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Al6MZIcJCcqJmhWCg2Dcbv+XvixG+8GmUNvFS20Yl5w=;
        b=ZUV9DYn1NbANDpSVYemyN0vo0WUD0TLWvGVyIpFMeEJSgj8uKZm1OPcF2feYjo/UeA
         17bgS42oGOnKEySl9vM4NjG3yaP5Si9C0jlaXfrAVcSCHRB172itS9Xhg70Qkq4vE1ui
         0d58crcxH5yBdnjLbB0bjYGoZs8Cj+YFCS1l2vAuZZRT+aHAzyK53HPff4mwgKLpBMKX
         sdSUQV4enY755mTaNTVGKcI4uDPwB3ttVMXpiplcnIOod1QWG7HLilOqKUPrjMgRH5ZV
         beDbt954wiuh6Pip2wafn7p6kAjSlL1zWSOS7Y9oSNQj6aa1peDlmWAjVdLgjw3lDps4
         e5wQ==
X-Gm-Message-State: AOAM530AcfchijDw5tph6EITs+GOdeQHnChfY0Mw1SDg1qVCS6HHnA8/
	REViP3paE6ko8m5ebHKTNPXsnqrlKDASqEni
X-Google-Smtp-Source: ABdhPJwR7i+hKyhxoc7LqQJNdPG8ByaTGuqVQ41fgUu+Je8waE/SvB+5GyOFEA9gbCPE5eZevX2qEg==
X-Received: by 2002:adf:fb84:: with SMTP id a4mr4796322wrr.315.1642787847095;
        Fri, 21 Jan 2022 09:57:27 -0800 (PST)
Received: from localhost.localdomain (p200300d997063800e3418724bb165e30.dip0.t-ipconnect.de. [2003:d9:9706:3800:e341:8724:bb16:5e30])
        by smtp.googlemail.com with ESMTPSA id g4sm7166329wrd.12.2022.01.21.09.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 09:57:26 -0800 (PST)
From: Manfred Spraul <manfred@colorfullife.com>
To: nbd@other.debian.org
Cc: Wouter Verhelst <w@uter.be>,
	Eric Blake <eblake@redhat.com>,
	Manfred Spraul <manfred.spraul@de.bosch.com>
Subject: [PATCH 5/9] nbd-server: Log the replies
Date: Fri, 21 Jan 2022 18:57:07 +0100
Message-Id: <20220121175711.5083-6-manfred@colorfullife.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121175711.5083-1-manfred@colorfullife.com>
References: <20220121175711.5083-1-manfred@colorfullife.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <KUMzFxS4ogD.A.fsC.2Qv6hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1701
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220121175711.5083-6-manfred@colorfullife.com
Resent-Date: Fri, 21 Jan 2022 17:58:14 +0000 (UTC)

From: Manfred Spraul <manfred.spraul@de.bosch.com>

The transaction log contains only the request from the clients, the
replies from the server were missing.

The change adds the replies to the transaction log.

Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
---
 nbd-server.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/nbd-server.c b/nbd-server.c
index 5ee9bbe..af14919 100644
--- a/nbd-server.c
+++ b/nbd-server.c
@@ -2616,6 +2616,15 @@ static void setup_reply(struct nbd_reply* rep, struct nbd_request* req) {
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
@@ -2637,6 +2646,7 @@ static int handle_splice_read(CLIENT *client, struct nbd_request *req)
 
 	DEBUG("handling read request (splice)\n");
 	setup_reply(&rep, req);
+	log_reply(client, &rep);
 	pthread_mutex_lock(&(client->lock));
 	writeit(client->net, &rep, sizeof(rep));
 	spliceit(pipefd[0], NULL, client->net, NULL, req->len);
@@ -2660,6 +2670,7 @@ static void handle_normal_read(CLIENT *client, struct nbd_request *req)
 		DEBUG("Read failed: %m");
 		rep.error = nbd_errno(errno);
 	}
+	log_reply(client, &rep);
 	pthread_mutex_lock(&(client->lock));
 	socket_write(client, &rep, sizeof rep);
 	if(!rep.error) {
@@ -2708,6 +2719,7 @@ static void handle_write(struct work_package *pkg)
 			rep.error = nbd_errno(errno);
 		}
 	}
+	log_reply(client, &rep);
 	pthread_mutex_lock(&(client->lock));
 	socket_write(client, &rep, sizeof rep);
 	pthread_mutex_unlock(&(client->lock));
@@ -2721,6 +2733,7 @@ static void handle_flush(CLIENT* client, struct nbd_request* req) {
 		DEBUG("Flush failed: %m");
 		rep.error = nbd_errno(errno);
 	}
+	log_reply(client, &rep);
 	pthread_mutex_lock(&(client->lock));
 	socket_write(client, &rep, sizeof rep);
 	pthread_mutex_unlock(&(client->lock));
@@ -2734,6 +2747,7 @@ static void handle_trim(CLIENT* client, struct nbd_request* req) {
 		DEBUG("Trim failed: %m");
 		rep.error = nbd_errno(errno);
 	}
+	log_reply(client, &rep);
 	pthread_mutex_lock(&(client->lock));
 	socket_write(client, &rep, sizeof rep);
 	pthread_mutex_unlock(&(client->lock));
@@ -2751,6 +2765,7 @@ static void handle_write_zeroes(CLIENT* client, struct nbd_request* req) {
 	// For now, don't trim
 	// TODO: handle this far more efficiently with reference to the
 	// actual backing driver
+	log_reply(client, &rep);
 	pthread_mutex_lock(&(client->lock));
 	socket_write(client, &rep, sizeof rep);
 	pthread_mutex_unlock(&(client->lock));
@@ -2837,6 +2852,7 @@ static void handle_request(gpointer data, gpointer user_data) {
 error:
 	setup_reply(&rep, package->req);
 	rep.error = nbd_errno(err);
+	log_reply(package->client, &rep);
 	pthread_mutex_lock(&(package->client->lock));
 	socket_write(package->client, &rep, sizeof rep);
 	pthread_mutex_unlock(&(package->client->lock));
-- 
2.34.1

