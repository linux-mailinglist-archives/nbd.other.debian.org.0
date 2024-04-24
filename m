Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EC98B0FC8
	for <lists+nbd@lfdr.de>; Wed, 24 Apr 2024 18:29:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BDEF120515; Wed, 24 Apr 2024 16:29:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Apr 24 16:29:11 2024
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_SCAM1,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SARE_MSGID_LONG45,SARE_MSGID_LONG50
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F289C204E6
	for <lists-other-nbd@bendel.debian.org>; Wed, 24 Apr 2024 16:28:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.756 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-2.355, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_SCAM1=0.1, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
	SARE_MSGID_LONG45=0.893, SARE_MSGID_LONG50=0.726]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id G1c4XRYnDs-V for <lists-other-nbd@bendel.debian.org>;
	Wed, 24 Apr 2024 16:28:43 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id CBEAF204F6
	for <nbd@other.debian.org>; Wed, 24 Apr 2024 16:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713976117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sts88J8gtGc47ctwXFOiOOQUJA7LQKVYxFsCSuoP45Q=;
	b=ibg8Tl6J8+TYZ2R915AVlsLdbs31EnFqbYL8Mg8IQtovurtE/DjnsR65fSqpoUZskufRB/
	cRfY9mWtM86f3ggQakFVTj1Qp/fNYoIr4CVD95O4uprZb1zRm3a5KkLfaBjiAX5V+pymcb
	yPNsB3VawT2emV18CXfDgvwhaK5R1js=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-IduZjVQXMMOEd8N9BNky8w-1; Wed, 24 Apr 2024 12:28:36 -0400
X-MC-Unique: IduZjVQXMMOEd8N9BNky8w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7A97834FB4;
	Wed, 24 Apr 2024 16:28:35 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEC8D492BC6;
	Wed, 24 Apr 2024 16:28:34 +0000 (UTC)
Date: Wed, 24 Apr 2024 11:28:32 -0500
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org
Subject: Re: Updating the NBD assignment at IANA
Message-ID: <yldgnmy4nz3s2fwpvyrnq3lwxs2hhqsqrq7iabxi3iq5rjylic@5ke53aicdrja>
References: <Zij-Wnsu2F7_HwMZ@pc220518.home.grep.be>
MIME-Version: 1.0
In-Reply-To: <Zij-Wnsu2F7_HwMZ@pc220518.home.grep.be>
User-Agent: NeoMutt/20240201
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <r-cMgIDKx1N.A.aBF.XNTKmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2798
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/yldgnmy4nz3s2fwpvyrnq3lwxs2hhqsqrq7iabxi3iq5rjylic@5ke53aicdrja
Resent-Date: Wed, 24 Apr 2024 16:29:11 +0000 (UTC)

On Wed, Apr 24, 2024 at 02:43:06PM +0200, Wouter Verhelst wrote:
> Hi all,
> 
> Way back in 2010, I requested a port number with IANA for NBD. They
> assigned port 10809 to it[1]. The procedure to request a port number, at
> the time, also included the requirement to provide a "description", for
> which I gave "Linux Network Block Device", and contact information of an
> "Assignee" and "Contact"; for both of these I passed myself.
> 
> Things have moved on since then, however, and I don't think all of that
> is appropriate anymore. So I would like to contact IANA to ask them to
> update the assignment:
> 
> - For the "Assignee", I would like to ask them to mention this
>   mailinglist. I am not sure whether IANA allows mailinglists with
>   public archives to be used in this manner; but according to RFC6335,
>   "The Assignee is the organization, company or individual person
>   responsible for the initial assignment," which to me means that the
>   mailinglist is most appropriate.
> - I'll leave the contact as is for now. RFC6335 mentions "The Contact
>   person is the responsible person for the Internet community to send
>   questions to.  This person is also authorized to submit changes on
>   behalf of the Assignee; in cases of conflict between the Assignee and
>   the Contact, the Assignee decisions take precedence," which to me
>   reads like a person is required (and I'm happy to continue filling
>   this role).

I'm reading that as: A person is required for Contact, but cannot
unilaterally override decisions made by the the mailing list as
Assignee.  I doubt it will form any conflict in practice (you can
easily forward any contact directly to you back to the list, and the
list has generally been low-traffic and well-behaved with no one out
to commandeer things).

Of course, given the recent xz news, it's always a wise idea to worry
about whether a malicious actor could set up enough sockpuppet
accounts to try and take over list traffic in a way to sway things
different from what the current core developers believe; but in terms
of risk analysis, I don't see the reward (here, the ability to mislead
IANA) as a risk that we need to spend much time fretting over.

> - For the description, I would like to drop the "Linux" part in the
>   description. There are implementations of NBD that are wholly
>   unrelated to Linux, and so I don't think it's entirely accurate
>   anymore to refer to NBD as a "Linux" protocol.
> - At the time, there was no public reference for the NBD protocol yet; I
>   plan to add the link to proto.md on github as the official reference.
> 
> Thoughts?

Sounds good to me.

> 
> [1] https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml?search=nbd
> 
> -- 
>      w@uter.{be,co.za}
> wouter@{grep.be,fosdem.org,debian.org}
> 
> I will have a Tin-Actinium-Potassium mixture, thanks.
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org

