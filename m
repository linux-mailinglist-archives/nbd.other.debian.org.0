Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D59DC9D30EB
	for <lists+nbd@lfdr.de>; Wed, 20 Nov 2024 00:31:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B971A20651; Tue, 19 Nov 2024 23:31:22 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov 19 23:31:22 2024
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	PAGE_LINK_SPAM_BODY,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3793F2064D
	for <lists-other-nbd@bendel.debian.org>; Tue, 19 Nov 2024 23:31:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.539 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, PAGE_LINK_SPAM_BODY=5, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id MCsCt4GI1OKs for <lists-other-nbd@bendel.debian.org>;
	Tue, 19 Nov 2024 23:31:08 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 113161 seconds by postgrey-1.36 at bendel; Tue, 19 Nov 2024 23:31:08 UTC
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 8112B20643
	for <nbd@other.debian.org>; Tue, 19 Nov 2024 23:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732059063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zTsJUJXexSvcj9HYSoRe3B9wjFA0++ZYL2MEPMm3ENU=;
	b=gb64ESHk4HsvkZbYq+Hw8mXJ3FpSnN0vcNBvAhDp9XiRxPyyPZpR6OzAF6kw65RVuT72c9
	SeX68+G4JLk9XEUm7Xmkefw+cCRG7OGbzDLBL68H45MK69JARucNZL0U8lUloYX/K3TUDs
	7bRWOuQXGMP2kUd3OB5FPF2jWoVLBWk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-675-0qb2EYFCPKGMW0SE3T2v7g-1; Tue,
 19 Nov 2024 18:31:01 -0500
X-MC-Unique: 0qb2EYFCPKGMW0SE3T2v7g-1
X-Mimecast-MFC-AGG-ID: 0qb2EYFCPKGMW0SE3T2v7g
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 981C01955D44
	for <nbd@other.debian.org>; Tue, 19 Nov 2024 23:31:00 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.76])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CD9151956086;
	Tue, 19 Nov 2024 23:30:59 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: stefanha@redhat.com
Subject: [PATCH 1/2] nbd-client: Fix use without -N
Date: Tue, 19 Nov 2024 17:27:28 -0600
Message-ID: <20241119233057.2248038-2-eblake@redhat.com>
In-Reply-To: <20241119233057.2248038-1-eblake@redhat.com>
References: <20241119233057.2248038-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JDGlkCVjNti59hUh3wSg3W2BBM0VlxwjOxa7eYISUX4_1732059060
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <1zctUPTtvkJ.A.bhIL.K_RPnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3192
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20241119233057.2248038-2-eblake@redhat.com
Resent-Date: Tue, 19 Nov 2024 23:31:22 +0000 (UTC)

The refactoring in commit 17043b068 causes nbd-client without -N to
segfault, instead of using the desired default export.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 .gitignore   | 1 +
 nbd-client.c | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index 048c6fd0..94752d22 100644
--- a/.gitignore
+++ b/.gitignore
@@ -18,6 +18,7 @@ manpage.links
 mkinstalldirs
 nbd-tester-client
 nbd-client
+nbd-get-status
 nbd-server
 nbd-trplay
 doc/doxygen-output
diff --git a/nbd-client.c b/nbd-client.c
index 06d1440f..e9a42009 100644
--- a/nbd-client.c
+++ b/nbd-client.c
@@ -1182,7 +1182,9 @@ int main(int argc, char *argv[]) {
 		exit(EXIT_FAILURE);
 	}

-	if((!cur_client->name || strlen(cur_client->name)==0) && !(opts & NBDC_DO_LIST)) {
+	if(!cur_client->name)
+		cur_client->name = "";
+	if((strlen(cur_client->name)==0) && !(opts & NBDC_DO_LIST)) {
 		printf("Warning: the oldstyle protocol is no longer supported.\nThis method now uses the newstyle protocol with a default export\n");
 	}

-- 
2.47.0

