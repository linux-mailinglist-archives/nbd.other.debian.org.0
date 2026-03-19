Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FXuNeoTvGnbrwIAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Thu, 19 Mar 2026 16:19:06 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B2F2CD927
	for <lists+nbd@lfdr.de>; Thu, 19 Mar 2026 16:19:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1CF62205C9; Thu, 19 Mar 2026 15:19:06 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar 19 15:19:06 2026
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,SUBJ_ALL_CAPS
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D6BFD205C3
	for <lists-other-nbd@bendel.debian.org>; Thu, 19 Mar 2026 15:18:56 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.7 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5,
	SUBJ_ALL_CAPS=0.5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id IJLHmYMup9Xt for <lists-other-nbd@bendel.debian.org>;
	Thu, 19 Mar 2026 15:18:50 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id F2F93205C2
	for <nbd@other.debian.org>; Thu, 19 Mar 2026 15:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:
	Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=42wpmpVSz2BUO+soPv2xnK6K7D87OI9TBqB9ahLCxsU=; b=he+POZGB0BYygEHTyC5yqWQbDc
	DPdhH19SMmjFCrD+Ue9mBE/wGTkFVXy7izJBH1Avjg6Kzcry1miQI2lrVkQIqMEnN5a5gxT3E9s7u
	hgDJm8FDJSwcfm9dOBLlLTtx+/ZINO3DNr6WhdkxshDVBcps/M4TweXXfe6mpBgyTqnbS5q0pLBq1
	pAz5nVm5wNs2H+i2GguBC1A3XICi2/tbM4QW4XX6zo/msEzz3zp3r8RQ6sV3SXKfZk0IcMQhWpBWp
	kL1mbYw/mT+3E9ZkieM1w0RVn7hRkFlNK+rl+ASO/9UkBSFG1DPFJfmx8z7gFMTucDB7tEAZZwtiK
	gUvE8BTw==;
Received: from [41.193.88.87] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <w@uter.be>)
	id 1w3F95-0000000Fhrz-24rO
	for nbd@other.debian.org;
	Thu, 19 Mar 2026 16:18:47 +0100
Received: from wouter by pc220518 with local (Exim 4.99.1)
	(envelope-from <w@uter.be>)
	id 1w3F8w-00000004IzZ-1j0q
	for nbd@other.debian.org;
	Thu, 19 Mar 2026 17:18:38 +0200
Date: Thu, 19 Mar 2026 17:18:38 +0200
From: Wouter Verhelst <w@uter.be>
To: nbd@other.debian.org
Subject: NBD 3.27.0
Message-ID: <abwTzj4uxGyUZ3Pj@pc220518.home.grep.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <hrG5v6ZKM5D.A.2avM.qPBvpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3520
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/abwTzj4uxGyUZ3Pj@pc220518.home.grep.be
Resent-Date: Thu, 19 Mar 2026 15:19:06 +0000 (UTC)
X-Spamd-Result: default: False [1.44 / 15.00];
	R_DKIM_REJECT(1.00)[uter.be:s=2021.lounge];
	SUBJ_ALL_CAPS(0.75)[10];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[82.195.75.100:from];
	DMARC_POLICY_SOFTFAIL(0.10)[uter.be : No valid SPF,none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nbd@other.debian.org,s:lists@lfdr.de];
	R_SPF_NA(0.00)[no SPF record];
	FORGED_SENDER(0.00)[w@uter.be,bounce-nbd=lists@other.debian.org];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	DKIM_TRACE(0.00)[uter.be:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[w@uter.be,bounce-nbd=lists@other.debian.org];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.969];
	TAGGED_RCPT(0.00)[nbd];
	ASN(0.00)[asn:8365, ipnet:82.195.64.0/19, country:DE];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pc220518.home.grep.be:mid]
X-Rspamd-Queue-Id: 86B2F2CD927
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

I've just released NBD 3.27.0

Get it at https://github.com/NetworkBlockDevice/nbd/releases/tag/nbd-3.27.0

The last release was 2 (!) years ago, which is kinda terrible. Changes
since then include:

New features:
- nbd-client's persist mode now works with the netlink API (Wouter Verhelst)
- Encrypted communications now default to enable modern versions of TLS by
  default, if supported by the installed GnuTLS. That is, TLS1.0 and 1.1 are
  disabled, everything else supported by your GnuTLS is enabled. (Wouter
  Verhelst)
- nbd-client: Add support for setting /sys/block/nbdN/backend (Eric Blake)
- nbd-client's -c option now uses the netlink "get status" command when netlink
  mode is active, rather than checking files under /sys

Bug fixes:
- nbd-client systemd service file is generated correctly again (Christian
  Hesse)
- nbdtab again defaults the port number to the default 10809 rather than "0"
  (Dave Jones)
- passing --disable-manpages to configure when docbook2man is installed now no
  longer fails (Dave Jones)
- Drop uses of g_key_file_free, as we chose the garbage collection mode in the
  previous release.
- A few fixes and refactors in treefiles mode (roker)
- Fix builds on musl with gcc14 (Khem Raj)
- nbd-client: Improve error message received when the invoker is not root and
  tries to configure an NBD device
- nbd-client: Improve error message received when the device is in use (Lin
  Liu)
- Drop use of the daemon() function which is not supported by all OSes
  (Wouter Verhelst)
- Fix infinite loop in TLS handling (Janis Kalofolias)
- Fix copy-on-write corruption (berend de schouwer)

Tests:
- Write a mock libnl to improve nbd-client test coverage (Wouter Verhelst)
- dup.c: Fix incorrect comparison (Baruch)
- If cwrap is installed, run the entire test suite inside socket_wrapper and
  nss_wrapper (Wouter Verhelst). This requires that we change the gnutls push
  and pull functions, but we do that for the test suite *only*.

Removed functionality:
- drop gznbd, has not been maintained for years and is not functional with
  modern nbd-client, either.

If there's any issues, please do not hesitate to yell at me :)

Kind regards,

-- 
"I never had a C in history!"
"Yeah, but there was so much less of it when you were my age!"
 -- Joe Brockmeier recounting a conversation with his father, cfgmgmtcamp 2026, Ghent

