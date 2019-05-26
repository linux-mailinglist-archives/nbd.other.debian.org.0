Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC6D2A909
	for <lists+nbd@lfdr.de>; Sun, 26 May 2019 10:15:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A1371204B7; Sun, 26 May 2019 08:15:54 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun May 26 08:15:54 2019
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=4.0 tests=FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E6DC8204B3
	for <lists-other-nbd@bendel.debian.org>; Sun, 26 May 2019 08:15:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id aGr_7sc36EGu for <lists-other-nbd@bendel.debian.org>;
	Sun, 26 May 2019 08:15:44 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 43D9B204AF
	for <nbd@other.debian.org>; Sun, 26 May 2019 08:15:44 +0000 (UTC)
Received: from [197.89.111.44] (helo=gangtai.home.grep.be)
	by latin.grep.be with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <w@uter.be>)
	id 1hUoJg-0003Gt-HA; Sun, 26 May 2019 10:15:40 +0200
Received: from wouter by gangtai.home.grep.be with local (Exim 4.92)
	(envelope-from <w@uter.be>)
	id 1hUoJZ-0001qM-7j; Sun, 26 May 2019 10:15:33 +0200
Date: Sun, 26 May 2019 10:15:33 +0200
From: Wouter Verhelst <w@uter.be>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: nbd@other.debian.org, eblake@redhat.com, nsoffer@redhat.com,
	berrange@redhat.com, mkletzan@redhat.com
Subject: Re: [PATCH for discussion] doc: Define a standard URI syntax for NBD
 URIs.
Message-ID: <20190526081532.GA6936@grep.be>
References: <20190525170518.4799-1-rjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190525170518.4799-1-rjones@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4XqiO6FKAaN.A.wVD.6sk6cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/521
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190526081532.GA6936@grep.be
Resent-Date: Sun, 26 May 2019 08:15:54 +0000 (UTC)

Hi Rich,

Just a few minor comments:

On Sat, May 25, 2019 at 06:05:18PM +0100, Richard W.M. Jones wrote:
> +The `userinfo` field is used to supply a username for TLS
> +authentication.  If the `userinfo` field is not present then it SHOULD
> +default to a local operating system credential if one is available.

Should we perhaps also add query parameters for certificate-based authentication?

Also, I think this could be rephrased in a way that makes it clear that
usernames are not required for NBD, and that absense of them (or of a
default) is not an error.

> +It is up to the NBD client what should happen if the authority field
> +is not present for TCP/IP connections, or present for Unix domain
> +socket connections.  Options might include failing with an error,
> +ignoring it, or using defaults.
[...]
> +## NBD URI query parameters
> +
> +The query part of the URI is used when connecting to Unix domain
> +sockets (when the scheme name is `nbd+unix`).  In this case it MUST
> +include a `socket` key, referring to the Unix domain socket which on
> +Unix-like systems is usually a special file on the local disk.
> +
> +Query parameters other than `socket` SHOULD be ignored by the parser.

Would it be a good idea to also allow for a default Unix domain socket,
similarly to how you add a default authority field?

Other than that, LGTM.

Side note: you'll notice that I've sent you an invitation to the
NetworkBlockDevice project, so you can commit this yourself if you want
to. Please don't abuse the privilege ;-)

-- 
To the thief who stole my anti-depressants: I hope you're happy

  -- seen somewhere on the Internet on a photo of a billboard

