Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id F02B6185B09
	for <lists+nbd@lfdr.de>; Sun, 15 Mar 2020 08:30:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9A3572054C; Sun, 15 Mar 2020 07:30:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Mar 15 07:30:12 2020
Old-Return-Path: <net147@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,WORD_WITHOUT_VOWELS autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 777C220358
	for <lists-other-nbd@bendel.debian.org>; Sun, 15 Mar 2020 07:12:39 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.171 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id d78thv1ynALS for <lists-other-nbd@bendel.debian.org>;
	Sun, 15 Mar 2020 07:12:35 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 053F2204FC
	for <nbd@other.debian.org>; Sun, 15 Mar 2020 07:12:31 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id n7so7974219pfn.0
        for <nbd@other.debian.org>; Sun, 15 Mar 2020 00:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SbKIoLCW8FktpOjoZM8Ions/hz8w0mHlSIdwzhYClU8=;
        b=oLRCtpzbReQTzaqwvHnwK0NQxrk+DoSeSFUgXQ92nGXAWvuBX61LBd7ZDNaIMF82q+
         J0DNXyWg9PHjc1/vlqXFouiy4wyylWjNKbc4scO52Vnl7p/+6ALgXRjuHNqDRSqRhQ5Z
         CjAstj3e36ftstW/+DWCWmjxHEqZJnDh4bjlEFN0+igqYnMxFegbBXWQwyaXePKevxlL
         jo9nkZSfc04d7JJ25o7scPv8tNXpZJsOLa/YdOBAoOVx/mFNfMjQAiYwxGBU/LK1eLlL
         bu7N6GgBQJi4SXNQJbVwx4Ly7Ufk4cIS97uzUzQ4UHRbW0c4VZqhlT2IylaOjr2oobOe
         dOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SbKIoLCW8FktpOjoZM8Ions/hz8w0mHlSIdwzhYClU8=;
        b=EVthbArZS5U3ZfXSwf9x6NOAah5IiJSj36DysxS4C6uIZXg2RWkccKL/8hVfp++HJD
         7S/oK6ORs031ncm3ZlgGsXQs1o439p94AnHwvRSLESWyWddALMOvjzdz0IPUW+qf+9bC
         FkYSFgjBC2p8WfVYQwt0n+tza5sMU2oc37f0fzSJyUXpmnW4rWeZEYhkfzKUHfl1dtCI
         RPfokxuyMq94TvNTsxLkUGjgY5URdRYFKXFxYx++5lLsuNXYZGqkPFjcIfO7LkgMN7Qy
         y5cQAOBqlGVAtbJn3Kn3Mc1e6oW+EGS+tMum5S/h6p54yE2M/DFSMf8p4P8cjh6uc8Q1
         Y+fw==
X-Gm-Message-State: ANhLgQ3C3nGpTwQPj2O6HF6YkACz/yUxIxMj9x+S9x/SNgGzwX77Ujh2
	FKltEPIHdk21+xGNTI243QzCM1vA
X-Google-Smtp-Source: ADFU+vsAR777y2U6Qwgci7nk0rHi+vU/u3UGzVlXVrgHlDFAoTRbMjHj5Mk8YWGM3+b0LNJesODgPQ==
X-Received: by 2002:a63:3449:: with SMTP id b70mr21209935pga.242.1584256348291;
        Sun, 15 Mar 2020 00:12:28 -0700 (PDT)
Received: from 119-18-5-146.771205.syd.nbn.aussiebb.net (119-18-5-146.771205.syd.nbn.aussiebb.net. [119.18.5.146])
        by smtp.gmail.com with ESMTPSA id w27sm12357585pfq.211.2020.03.15.00.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2020 00:12:27 -0700 (PDT)
Received: by 119-18-5-146.771205.syd.nbn.aussiebb.net (Postfix, from userid 1000)
	id 6A01F1A3194C; Sun, 15 Mar 2020 18:12:24 +1100 (AEDT)
From: Jonathan Liu <net147@gmail.com>
To: nbd@other.debian.org
Cc: Jonathan Liu <net147@gmail.com>
Subject: [PATCH] server: trim whitespace from lines in authorization file
Date: Sun, 15 Mar 2020 18:10:51 +1100
Message-Id: <20200315071051.9403-1-net147@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <vCX2oxNUpgM.A.zY.EmdbeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/853
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200315071051.9403-1-net147@gmail.com
Resent-Date: Sun, 15 Mar 2020 07:30:12 +0000 (UTC)

The netmask line can fail to parse when passed to getaddrinfo if it
contains whitespace such as newline when using glibc 2.29 and later.
This results in clients being denied access even though their IP
address is listed in the authorization file.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 nbdsrv.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/nbdsrv.c b/nbdsrv.c
index b4fa800..168d425 100644
--- a/nbdsrv.c
+++ b/nbdsrv.c
@@ -127,6 +127,7 @@ int authorized_client(CLIENT *opts) {
   
 	while (fgets(line,LINELEN,f)!=NULL) {
 		char* pos;
+		char* endpos;
 		/* Drop comments */
 		if((pos = strchr(line, '#'))) {
 			*pos = '\0';
@@ -140,7 +141,12 @@ int authorized_client(CLIENT *opts) {
 		if(!(*pos)) {
 			continue;
 		}
-		if(address_matches(line, (struct sockaddr*)&opts->clientaddr, NULL)) {
+		/* Trim trailing whitespace */
+		endpos = pos;
+		while ((*endpos) && !isspace(*endpos))
+			endpos++;
+		*endpos = '\0';
+		if(address_matches(pos, (struct sockaddr*)&opts->clientaddr, NULL)) {
 			fclose(f);
 			return 1;
 		}
-- 
2.25.1

