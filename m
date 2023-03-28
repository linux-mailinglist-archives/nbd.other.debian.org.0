Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFB76CC174
	for <lists+nbd@lfdr.de>; Tue, 28 Mar 2023 15:53:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9CDC120515; Tue, 28 Mar 2023 13:53:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar 28 13:53:21 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SARE_MSGID_LONG45,SARE_MSGID_LONG50 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 23ABB20504
	for <lists-other-nbd@bendel.debian.org>; Tue, 28 Mar 2023 13:53:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.563 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, SARE_MSGID_LONG45=0.893,
	SARE_MSGID_LONG50=0.726] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id v7keEAxVo0By for <lists-other-nbd@bendel.debian.org>;
	Tue, 28 Mar 2023 13:53:04 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 1E21F204FC
	for <nbd@other.debian.org>; Tue, 28 Mar 2023 13:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680011579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UElZLV5EgKedCbJx28RlzHnpKNvvH9YxQgxXCWNKXmg=;
	b=XxnSSr3J7Iy2+5KJhfuO/08tzV4aaHtU0X6tEmC1ClNiP3fcwkLj8b0z2tQzkq82auF3gh
	mFh7Dp8W8Ndy7Wf8kYl9iPl3fCw6i3hNtw9DOu7SIiEfGShq984tCDakjgRjtxc2IQJuiv
	9ckJ+Z8a3/8eNPZlhIxMMbNP+T/8kBU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-vWuCjzJDNS-FeL_nE3go9g-1; Tue, 28 Mar 2023 09:52:55 -0400
X-MC-Unique: vWuCjzJDNS-FeL_nE3go9g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 857B6801210;
	Tue, 28 Mar 2023 13:52:55 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.173])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 405002166B29;
	Tue, 28 Mar 2023 13:52:55 +0000 (UTC)
Date: Tue, 28 Mar 2023 08:52:53 -0500
From: Eric Blake <eblake@redhat.com>
To: w@uter.be
Cc: nbd@other.debian.org
Subject: Re: [PATCH 3/4] Implement structured reply handling
Message-ID: <gcw6dfmawjapzopyupimpysfxgl2xofpdceexcirlyjr4e7fmc@l3uem4idg3r3>
References: <20230311130705.253855-1-w@uter.be>
 <20230311130705.253855-4-w@uter.be>
MIME-Version: 1.0
In-Reply-To: <20230311130705.253855-4-w@uter.be>
User-Agent: NeoMutt/20230322
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <OZMTJuvbfUG.A.L2G.RFvIkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2413
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/gcw6dfmawjapzopyupimpysfxgl2xofpdceexcirlyjr4e7fmc@l3uem4idg3r3
Resent-Date: Tue, 28 Mar 2023 13:53:21 +0000 (UTC)

On Sat, Mar 11, 2023 at 03:07:04PM +0200, w@uter.be wrote:
> From: Wouter Verhelst <w@uter.be>
> 
> This implements the transmission phase part of structured replies as documented
> in doc/proto.txt, but does not do the negotiation phase part of this (yet).
> 
> Signed-off-by: Wouter Verhelst <w@uter.be>

>  
> +static void log_structured_reply(CLIENT *client, struct nbd_structured_reply *prply) {
> +	if (client->transactionlogfd != -1) {
> +		lock_logsem(client);
> +		writeit(client->transactionlogfd, prply, sizeof(*ptply));

nbd-server.c: In function ‘log_structured_reply’:
nbd-server.c:1291:66: error: ‘ptply’ undeclared (first use in this function); did you mean ‘prply’?
 1291 |               writeit(client->transactionlogfd, prply, sizeof(*ptply));
      |                                                                ^~~~~
      |                                                                prply
nbd-server.c:1291:66: note: each undeclared identifier is reported only once for each function it appears in

My R-b assumes the obvious typo fix ;)

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

